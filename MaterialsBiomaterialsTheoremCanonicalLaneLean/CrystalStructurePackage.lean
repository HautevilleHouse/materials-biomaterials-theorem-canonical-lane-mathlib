import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MaterialsBiomaterialsTheoremCanonicalLaneLean

structure CrystalStructurePackage where
  latticeSystem : String
  spaceGroup : String
  bravaisLattice : Type u
  basisVectors : bravaisLattice → bravaisLattice → ℝ
  symmetryGroup : bravaisLattice → bravaisLattice
  unitCellVolume : ℝ
  atomicPositions : List bravaisLattice
  latticeSystemWellFormed : Prop
  spaceGroupWellDefined : Prop
  symmetryGroupClosed : latticeSystemWellFormed → spaceGroupWellDefined → Prop

structure CrystalStructureEvidence (C : CrystalStructurePackage) where
  latticeSystemWellFormedClosed : C.latticeSystemWellFormed
  spaceGroupWellDefinedClosed : C.spaceGroupWellDefined
  symmetryGroupClosedFromEvidence : C.symmetryGroupClosed C.latticeSystemWellFormed C.spaceGroupWellDefined

def CrystalStructureClosed (C : CrystalStructurePackage) : Prop :=
  C.latticeSystemWellFormed ∧ C.spaceGroupWellDefined ∧ C.symmetryGroupClosed C.latticeSystemWellFormed C.spaceGroupWellDefined

theorem crystal_structure_closed_from_evidence (C : CrystalStructurePackage) (E : CrystalStructureEvidence C) :
    CrystalStructureClosed C := by
  exact And.intro E.latticeSystemWellFormedClosed
    (And.intro E.spaceGroupWellDefinedClosed E.symmetryGroupClosedFromEvidence)

end HautevilleHouse
end MaterialsBiomaterialsTheoremCanonicalLaneLean