import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MaterialsBiomaterialsTheoremCanonicalLaneLean

structure CrystallographyPackage where
  bravaisLattice : Type u
  unitCell : Type v
  symmetryGroup : Type w
  latticeParameters : Prop
  atomicBasis : Prop
  spaceGroup : Prop

structure CrystallographyEvidence (C : CrystallographyPackage) where
  latticeParametersClosed : C.latticeParameters
  atomicBasisClosed : C.atomicBasis
  spaceGroupClosed : C.spaceGroup

def CrystallographyClosed (C : CrystallographyPackage) : Prop :=
  C.latticeParameters ∧ C.atomicBasis ∧ C.spaceGroup

theorem crystallography_closed_from_evidence (C : CrystallographyPackage) (E : CrystallographyEvidence C) :
  CrystallographyClosed C := by
  exact And.intro E.latticeParametersClosed (And.intro E.atomicBasisClosed E.spaceGroupClosed)

end MaterialsBiomaterialsTheoremCanonicalLaneLean
end HautevilleHouse
