import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MaterialsBiomaterialsTheoremCanonicalLaneLean

structure CrystalStructurePackage where
  latticeVectors : Type u
  basisAtoms : Type v
  symmetryGroup : Type w
  bravaisLatticeIdentified : Prop
  unitCellVolume : Prop
  bravaisLatticeIdentifiedTerm : bravaisLatticeIdentified
  unitCellVolumeTerm : unitCellVolume

structure CrystalStructureEvidence (C : CrystalStructurePackage) where
  bravaisLatticeIdentifiedClosed : C.bravaisLatticeIdentified
  unitCellVolumeClosed : C.unitCellVolume

def CrystalStructureClosed (C : CrystalStructurePackage) : Prop :=
  C.bravaisLatticeIdentified ∧ C.unitCellVolume

theorem crystal_structure_closed_from_evidence (C : CrystalStructurePackage) (E : CrystalStructureEvidence C) :
    CrystalStructureClosed C := by
  exact And.intro E.bravaisLatticeIdentifiedClosed E.unitCellVolumeClosed

end MaterialsBiomaterialsTheoremCanonicalLaneLean
end HautevilleHouse