import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MaterialsBiomaterialsTheoremCanonicalLaneLean

structure CrystallographyPhaseDiagramPackage where
  symmGroup : Type u
  latticeVectors : Type v
  basisAtoms : Type w
  unitCellVolume : Float
  phaseBoundary : Prop
  freeEnergyMinimized : Prop
  phaseTransitionTemperature : Float
  spaceGroup : symmGroup -> Prop
  bravaisLattice : latticeVectors -> Prop
  atomicPositions : basisAtoms -> Prop
  phaseBoundaryClosed : phaseBoundary
  freeEnergyMinimizedClosed : freeEnergyMinimized

structure CrystallographyPhaseDiagramEvidence (C : CrystallographyPhaseDiagramPackage) where
  symmGroupClosed : C.spaceGroup C.symmGroup
  latticeClosed : C.bravaisLattice C.latticeVectors
  basisClosed : C.atomicPositions C.basisAtoms
  volumePositive : C.unitCellVolume > 0

def CrystallographyPhaseDiagramClosed (C : CrystallographyPhaseDiagramPackage) : Prop :=
  C.phaseBoundary ∧ C.freeEnergyMinimized ∧ C.unitCellVolume > 0

theorem crystallography_phase_diagram_closed_from_evidence
    (C : CrystallographyPhaseDiagramPackage) (E : CrystallographyPhaseDiagramEvidence C) :
    CrystallographyPhaseDiagramClosed C := by
  exact And.intro C.phaseBoundaryClosed (And.intro C.freeEnergyMinimizedClosed E.volumePositive)

end MaterialsBiomaterialsTheoremCanonicalLaneLean
end HautevilleHouse